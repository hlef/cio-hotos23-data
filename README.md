# Confidential I/O HotOS'23 Data

This repository contains the raw data of the plots of our HotOS'23 paper,
"Towards (Really) Safe and Fast Confidential I/O".

> **Abstract**: Confidential cloud computing enables cloud tenants to distrust
> their service provider. Achieving confidential computing solutions that
> provide concrete security guarantees requires not only strong mechanisms, but
> also carefully designed software interfaces. In this paper, we make the
> observation that confidential I/O interfaces, caught in the tug-of-war
> between performance and security, fail to address both
> at a time when confronted to interface vulnerabilities and observability by the
> untrusted host. We discuss the problem of safe I/O interfaces in confidential
> computing, its implications and challenges, and devise research paths to
> achieve confidential I/O interfaces that are both safe and fast. 

## Data Overview

### :page_facing_up: `cves_remote.csv`

Contains a list of Linux remotely exploitable CVEs, gathered with
`scripts/generate_nw_cve_table.sh`, and manually sanitized (may miss some
CVEs).

### :page_facing_up: `size_net.csv`

Contains data on the size of the Linux network subsystem over major versions,
gathered with `scripts/size_net.sh`.

### :page_facing_up: `commits_netvsc.csv`

Contains a study of all Linux NetVSC hardening commits for confidential trust
models. Obtained via systematic review of commits for relevant files and
maintainers.

### :page_facing_up: `commits_virtio.csv`

Contains a study of all Linux VirtIO hardening commits for confidential trust
models. Obtained via systematic review of commits for relevant files and
maintainers, combined with additional input from Jason Wang (Red Hat).

## License

For scripts, please see the SPDX headers. The data is available under the CC BY
license [here](https://creativecommons.org/licenses/by/4.0/).
