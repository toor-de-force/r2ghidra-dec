#!/usr/bin/env python3
import os
from pathlib import Path
import docker
import time
import argparse
from multiprocessing import Pool
from docker.errors import ContainerError
import os.path
import csv

BASE_COMMAND = 'sea yama -y /tmp/ghidrall.yaml bpf '
TOP_DIR = 'tests/generated'
DOCKER_IMAGE = 'seahorn/seahorn-llvm10:nightly'
CHUNKS = 4


def run_tests(input_file_list, opt, goal_strat, local_strat, directory, cpu):
    results = {}
    times = {}
    message = {}
    ret = []
    docker_client = client
    for idx, file in enumerate(input_file_list):
        print(f"processing {file}, {idx + 1} of {len(input_file_list)} in chunk {cpu}")
        name = file.split('.')[0] + "_" + opt + "_" + goal_strat + "_" + local_strat
        goal_location = os.path.join("/tmp", directory, file)
        cmd = BASE_COMMAND + goal_location
        start = time.time()
        try:
            out = docker_client.containers.run(DOCKER_IMAGE, cmd, volumes={os.getcwd(): {'bind': '/tmp/', 'mode': 'rw'}},
                                        mem_limit='2g', cpuset_cpus=str(cpu), stdout=True)
            result = out.decode("utf-8")
            if goal_strat == "goal":
                if "sat" in result and "unsat" not in result:
                    results[name] = "P"
                else:
                    results[name] = "F"
            else:  # nongoal
                if "sat" in result and "unsat" not in result:
                    results[name] = "F"
                else:
                    results[name] = "P"
            message[name] = result
        except ContainerError as e:
            message[name] = str(e)
            results[name] = "T"
        end = time.time()
        times[name] = str(end - start)
        ret.append({"name": name, "result": results[name], "time": times[name], "message": message[name]})
        print(f"name : {name}, result : {results[name]}, time : {times[name]}")
    return ret


if __name__ == "__main__":
    print("pulling docker image...")
    client = docker.from_env()
    client.images.pull(DOCKER_IMAGE)
    print("done")

    # Parse options.
    parser = argparse.ArgumentParser(description="Run Seahorn on files")
    parser.add_argument("-l", "--locals",
                        choices=["single_struct", "byte_addressable", "no_option"],
                        default="no_option",
                        help="choose how local variables are displayed")
    parser.add_argument("-n", "--nongoal", action="store_true",
                        help="Lift solver heuristics for anti-goals")
    parser.add_argument("-s", "--solver", choices=["bmc", "chc"], default="bmc",
                        help="Use the specified solver")
    parser.add_argument("-O", "--opt", choices=["0", "1", "2"], default="0",
                        help="Optimization level of source")

    args = parser.parse_args()

    binary_location = os.path.join("tests", "generated", args.opt, "binary")
    expected_files = [file.split('.')[0] for file in os.listdir(binary_location)]

    if not args.nongoal:
        goal_dir = Path(os.path.join(TOP_DIR, args.opt, 'goal'))
        goal = "goal"
    else:
        goal_dir = Path(os.path.join(TOP_DIR, args.opt, 'nongoal'))
        goal = "nongoal"

    locals_dir = Path(os.path.join(goal_dir, args.locals))
    file_list = [file for file in os.listdir(locals_dir)]
    locals_dir = os.path.join(TOP_DIR, args.opt, goal, args.locals)

    chunk_size = int(len(file_list) // CHUNKS) + 1
    print(f"{len(file_list)} files to process")
    chunks = [file_list[i:i + chunk_size] for i in range(0, len(file_list), chunk_size)]

    pool = Pool(processes=CHUNKS)

    o = args.opt
    l = args.locals

    input_list = [[chunks[cpu], o, goal, l, locals_dir, cpu] for cpu in range(len(chunks))]
    return_lists = pool.starmap(run_tests, input_list)

    csv_file = "/tmp/results.csv"
    passes = []
    fails = []
    timeouts = []
    with open(csv_file, "w") as csvfile:
        writer = csv.writer(csvfile)
        for chunk_list in return_lists:
            for file_dict in chunk_list:
                file_name = file_dict["name"]
                file_result = file_dict["result"]
                file_time = file_dict["time"]
                file_message = file_dict["message"]
                if file_result == "P":
                    passes.append(file_name)
                elif file_result == "T":
                    timeouts.append(file_name)
                else:
                    fails.append(file_name)
                writer.writerow([file_name, file_result, file_time, file_message])
    print(f"There were {len(passes)} passes, {len(timeouts)} tiemouts, and {len(fails)} fails.")
    print("Done!")