`timescale 1ns / 1ps

//# 4 inputs
//# 1 outputs
//# 3 D-type flipflops
//# 2 inverters
//# 8 gates (1 ANDs + 1 NANDs + 2 ORs + 4 NORs)

module s27 (input GND, VDD, CK, 
            input G0, G1, G2, G3, // PIs
            input SI0, SI1, SI2, // SIs
            input SE,
            output G17); // PO

wire G5, G10, G6, G11, G7, G13, G14, G8, G15, G12, G16, G9;
wire D0, D1, D2;

// Scan chain
mux  MUX_0   (.in1(G10), .in2(SI0), .sel(SE), .out(D0));
mux  MUX_1   (.in1(G11), .in2(SI1), .sel(SE), .out(D1));
mux  MUX_2   (.in1(G13), .in2(SI2), .sel(SE), .out(D2));

dff  DFF_0   (.clk(CK), .data(D0), .q(G5)); // SFF0
dff  DFF_1   (.clk(CK), .data(D1), .q(G6)); // SFF1
dff  DFF_2   (.clk(CK), .data(D2), .q(G7)); // SFF2

not  NOT_0   (G14, G0);
not  NOT_1   (G17, G11);
and  AND2_0  (G8, G14, G6);
or   OR2_0   (G15, G12, G8);
or   OR2_1   (G16, G3, G8);
nand NAND2_0 (G9, G16, G15);
nor  NOR2_0  (G10, G14, G11);
nor  NOR2_1  (G11, G5, G9);
nor  NOR2_2  (G12, G1, G7);
nor  NOR2_3  (G13, G2, G12);

endmodule
