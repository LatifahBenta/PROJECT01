#!/bin/bash

awk 'BEGIN{org=""; seq=""; max_len=0; min_len=1000000; max_org=""; min_org=""} 
     /^>/ { 
         if (org != "") {
             len=length(seq);
             if (len > max_len) {max_len=len; max_org=org}
             if (len < min_len) {min_len=len; min_org=org}
         }
         org=substr($0,2); # Assuming organism name starts right after ">"
         seq=""; 
     } 
     !/^>/ {seq=seq$0} 
     END { 
         # Final sequence check
         len=length(seq);
         if (len > max_len) {max_len=len; max_org=org}
         if (len < min_len) {min_len=len; min_org=org}
         print "Organism with the highest number of base pairs: " max_org " with " max_len " bases.";
         print "Organism with the least number of base pairs: " min_org " with " min_len " bases.";
     }' dengue_merged.fasta

