vsim FINAL

add wave * 

force SW(0) 0 0ns, 1 5ns -repeat 10ns
force SW(1) 0 0ns, 1 10ns -repeat 20ns	
force SW(2) 0 0ns, 1 20ns -repeat 40ns
force SW(3) 0 0ns, 1 80ns -repeat 160ns
force SW(4) 0 0ns, 1 160ns -repeat 320ns
force SW(5) 0 0ns, 1 320ns -repeat 640ns
force SW(6) 0 0ns, 1 640ns -repeat 1280ns
force SW(7) 0 0ns, 1 1280ns -repeat 2560ns

run 2560ns 

