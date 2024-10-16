# Copyright 2010-2024 Google LLC
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Helper macro to compile and test code samples."""

load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_test")

def code_sample_cc(name):
    cc_binary(
        name = name + "_cc",
        srcs = [name + ".cc"],
        deps = [
            "//ortools/base",
            "//ortools/routing:routing",
            "//ortools/routing:enums_cc_proto",
        ],
    )

    cc_test(
        name = name + "_cc_test",
        size = "small",
        srcs = [name + ".cc"],
        deps = [
            ":" + name + "_cc",
            "//ortools/base",
            "//ortools/routing:routing",
            "//ortools/routing:enums_cc_proto",
        ],
    )
