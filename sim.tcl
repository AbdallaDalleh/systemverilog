quit -sim
vlib work

vlog -work work -refresh -force_refresh
vcom -work work -refresh -force_refresh

vlog *.sv
vsim -voptargs="+acc" -gui work.top
add wave -hex sim:/top/ports/*
run -all