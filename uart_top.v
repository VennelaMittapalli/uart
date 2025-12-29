module uart_top(input clk,reset,Rx,btn1,[7:0]sw, output Tx,[7:0]RxData);

wire TxD_debug,transmit_debug,button_debug,clk_debug;

uart_receiver rxr(clk,reset,Rx,RxData);

uart transmiter(sw,reset,btn1,clk,Tx,TxD_debug,transmit_debug,button_debug,clk_debug); 

endmodule
