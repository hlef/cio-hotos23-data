#!/bin/bash

echo "Size of /net in the Linux main tree across Linux releases"

# for year by year
#  for ver in "9ddabb6700f82a033a76bcf7a547204fa12aaa17" "122804ecb59493fbb4d31b3ba9ac59faaf45276f" "bc6b1e7b86f5d8e4a6fc1c0189e64bba4077efe0" "1df0cbd509bc21b0c331358c1f9d9a6fc94bada8" "6222d1721dd7d533b43747642419a8ff78ad6f99" "b29906af20cf74bda2ec702626a26dc4501866ef" "a7f6c1b63b863d29f126d9b163ad5b40008544b2" "979a459c8347a797fd03717a3f12289c91617982" "8e8aa1454205839030c9406febd1f6d4ece0d573" "3b7c59754cc22760760a84ebddb8e0b1e8dd871b" "235ecd36c7a93e4d6c73ac71137b8f1fa31148dd" "9404bc1e58e4bed41f629da9e3b890b2ca1f8b9c";do

for ver in "1.0" "2.0"; do
  pushd /tmp &> /dev/null
    wget https://mirrors.edge.kernel.org/pub/linux/kernel/v${ver}/linux-${ver}.tar.gz &> /dev/null
    tar -xf linux-${ver}.tar.gz &> /dev/null
    echo "$ver $(sloccount linux/net | grep "ansic: " | grep -Po " (\d+) " | tr -d " ")"
  popd &> /dev/null
done

for ver in "3.0"; do
  pushd /tmp &> /dev/null
    wget https://mirrors.edge.kernel.org/pub/linux/kernel/v${ver}/linux-${ver}.tar.gz &> /dev/null
    tar -xf linux-${ver}.tar.gz &> /dev/null
    echo "$ver $(sloccount linux-${ver}/net | grep "ansic: " | grep -Po " (\d+) " | tr -d " ")"
  popd &> /dev/null
done

for ver in "4" "5" "6"; do
  pushd /tmp &> /dev/null
    wget https://mirrors.edge.kernel.org/pub/linux/kernel/v${ver}.x/linux-${ver}.0.tar.gz &> /dev/null
    tar -xf linux-${ver}.0.tar.gz &> /dev/null
    echo "$ver.0 $(sloccount linux-${ver}.0/net | grep "ansic: " | grep -Po " (\d+) " | tr -d " ")"
  popd &> /dev/null
done
