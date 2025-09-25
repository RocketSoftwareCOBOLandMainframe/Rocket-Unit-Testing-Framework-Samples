set -e
rm -f *.mfu
cob -vz -e "" MFUT_SAMPLE.cbl

cobmfurun -isolate:false -verbose MFUT_SAMPLE.so
cobmfurun -isolate:false -verbose -generate-mfu MFUT_SAMPLE.so
cobmfurun MFUT_SAMPLE.mfu
