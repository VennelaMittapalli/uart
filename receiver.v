module uart_receiver(
input clk_fpga,
input reset,
input RxD,
output [7:0]RxData);

reg shift;
reg state, next_state;
reg [3:0]bitcounter;
reg [1:0]sample_counter;
reg [13:0]baudrate_counter;
reg [9:0]rxshift_reg;
reg clear_bitcounter, inc_bitcounter, clear_samplecounter, inc_samplecounter;

//constant
parameter clk_freq = 100_000_000;
parameter baud_rate = 9600;
parameter div_sample=4;
parameter div_counter = clk_freq/(baud_rate*div_sample);
parameter mid_sample = (div_sample/2);
parameter div_bit = 10;//overall bits start, data, stop

assign RxData = rxshift_reg[8:1];

always @(posedge clk_fpga) begin
if(reset) begin
state <= 0;
sample_counter <= 0;
bitcounter <= 0;
baudrate_counter <= 0;
end
else begin
baudrate_counter <= baudrate_counter +1;
if(baudrate_counter >= div_counter - 1) begin
baudrate_counter <= 0;
state <= next_state;
if(shift) rxshift_reg <= {RxD, rxshift_reg[9:1]};
if(inc_samplecounter) sample_counter <= sample_counter + 1;
if(clear_samplecounter) sample_counter <= 0;
if(inc_bitcounter) bitcounter <= bitcounter + 1;
if(clear_bitcounter) bitcounter <= 0;
end
end
end

always @(posedge clk_fpga) 
begin
shift <= 0;
clear_samplecounter <= 0;
inc_samplecounter <= 0;
clear_bitcounter <= 0;
inc_bitcounter <= 0;
next_state <= 0;
case(state) 
0:begin
     if(RxD) begin 
    next_state <= 0;
    end
    else begin
    next_state <= 1;
    clear_bitcounter <= 1;
    clear_samplecounter <= 1;
    end
    end
1: begin 
    next_state <= 1;
    if(sample_counter == mid_sample-1)shift<=1; 
    if(sample_counter == div_sample-1)begin
     if(bitcounter == div_bit -1) begin
        next_state <= 0;
        end
        
        inc_bitcounter <= 1;
        clear_samplecounter <= 1;
        end
        else inc_samplecounter <= 1;
        end
        
        
default: next_state <= 0;
endcase
end
endmodule
