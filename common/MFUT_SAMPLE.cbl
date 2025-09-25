       Program-Id. MFUT_SAMPLE.
       Working-Storage Section.
       copy "mfunit.cpy".
       01 ws-counter       binary-long value 0.
       procedure division.
           if  MFU-MD-TESTCASE not equal "MFUT_SAMPLE"
               display "FAIL - MFUT_SAMPLE"
               goback returning 2
           end-if
           exhibit named ws-counter
           if ws-counter not equal 1
               display "FAIL"
               goback returning 1
           end-if
           Goback.


       entry "MFUT_SAMPLE1".
           if  MFU-MD-TESTCASE not equal "MFUT_SAMPLE1"
               display "FAIL - MFUT_SAMPLE1"
               goback returning 2
           end-if
           exhibit named ws-counter
           if ws-counter not equal 1
               display "FAIL"
               goback returning 1
           end-if
           goback.

       entry "MFUT_SAMPLE2".
           if MFU-MD-TESTCASE not equal "MFUT_SAMPLE2"
               display "FAIL - MFUT_SAMPLE2"
               goback returning 2
           end-if
           exhibit named ws-counter
           if ws-counter not equal 1
               display "FAIL"
               goback returning 1
           end-if
           goback.

       Entry MFU-TC-COMMON-SETUP-PREFIX & "Shared".
           exhibit named MFU-MD-TESTCASE
           if  MFU-MD-TESTCASE(1:11) equal "MFUT_SAMPLE"
               add 1 to ws-counter
           end-if
           goback.

           
       Entry MFU-TC-COMMON-TEARDOWN-PREFIX & "Shared".
           exhibit named MFU-MD-TESTCASE
           if  MFU-MD-TESTCASE(1:11) equal "MFUT_SAMPLE"
               subtract 1 from ws-counter
           end-if
           Goback.
           
       end program MFUT_SAMPLE.
