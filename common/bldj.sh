set -e
rm -rf test.bin/jvm
mkdir -p test.bin/jvm/bin

cob -j -C 'jvmgen(sub)' -C 'ilnamespace"com.mf.tests"' -C 'iloutput"test.bin/jvm/bin"' MFUT_SAMPLE.cbl

jar cvf test.bin/jvm/MFUT_SAMPLE.jar -C test.bin/jvm/bin .
mfjarprogmap -verbose -jar test.bin/jvm/MFUT_SAMPLE.jar
cobmfurunj -verbose test.bin/jvm/MFUT_SAMPLE.jar
cobmfurunj -verbose -generate-mfu test.bin/jvm/MFUT_SAMPLE.jar
cobmfurunj -verbose test.bin/jvm/MFUT_SAMPLE.mfu