#!/usr/bin/bash


ml icc

echo "start - O1"

icc -std=c++11 -O1 program.cpp -o program_O1

time for i in {1..10}
do
    ./program_O1
done

echo "start - O2"

icc -std=c++11 -O2 program.cpp -o program_O2

time for i in {1..10}
do
    ./program_O2
done

echo "start - O3"

icc -std=c++11 -O3 program.cpp -o program_O3

time for i in {1..10}
do
    ./program_O3
done

# for i in fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb cat_l3 cdp_l3 hw_pstate ssbd mba ibrs ibpb stibp vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid cqm rdt_a rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local clzero irperf xsaveerptr rdpru wbnoinvd cppc arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif v_spec_ctrl umip pku ospke vaes vpclmulqdq rdpid overflow_recov succor smca fsrm

for i in sse2 sse3 sse4.1 sse4.2 avx ATOM_SSE4.2 ATOM_SSSE3 SANDYBRIDGE SILVERMONT

do

echo "start - -x$i"

icc -x$i -std=c++11 program.cpp -o program_$i

time for i in {1..10}

do

./program_$i

done

done