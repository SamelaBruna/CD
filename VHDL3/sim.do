vsim somadorBCD

add wave * 

force A_BCD "1000" 0ns, "0101" 5ns, "1001" 10ns
force B_BCD "0000" 0ns, "1000" 5ns, "1001" 10ns 


run 15ns 

