module FSM (clk, reset, a, y);

   input logic  clk;
   input logic  reset;
   input logic 	a;
   
   output logic y;

   typedef enum 	logic [5:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
	  y <= 1'b0;	  
	  if (a) nextstate <= S0;
	  else   nextstate <= S1;
       end
       S1: begin
	  y <= 1'b0;	  	  
	  if (a) nextstate <= S2;
	  else   nextstate <= S1;
       end
       S2: begin
	  y <= 1'b1;	  	  
	  if (a) nextstate <= S2;
	  else   nextstate <= S0;
       end
       default: begin
	  y <= 1'b0;	  	  
	  nextstate <= S0;
       end
     endcase
   
endmodule
