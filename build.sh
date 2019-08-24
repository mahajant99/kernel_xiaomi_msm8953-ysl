git clone https://github.com/RevanthTolety/Toolchain ~/Toolchain
export ARCH=arm64
export CROSS_COMPILE=~/Toolchain/bin/aarch64-linux-android-
mkdir output
make -C $(pwd) O=output ysl_defconfig
make -j32 -C $(pwd) O=output
git clone https://github.com/mahajant99/AnyKernel3.git -b ysl-aosp zip
cp -r output/arch/arm64/boot/Image.gz-dtb zip/
cd zip
mv Image.gz-dtb zImage 
zip -r Test-Pie-kernel.zip *