module tb ();
  
  parameter DATA_WIDTH = 32;
  parameter ADDR_WIDTH = 10;
  
  reg WE;
  reg [ADDR_WIDTH-1:0] Addr;
  reg [DATA_WIDTH-1:0] WrData;
  wire [DATA_WIDTH-1:0] RdData;
  
  async_mem #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH)
  )
  u_async_mem(
    .WE(WE),
    .Addr(Addr),
    .WrData(WrData),
    .RdData(RdData)
  );
  
  initial begin
    WE = 0;
    WrData = 0;    
    for (int ii=0; ii<(1<<ADDR_WIDTH)-1; ii++)
      mem_write(ii);
    for (int ii=0; ii<(1<<ADDR_WIDTH)-1; ii++)
      mem_read(ii);
    $finish();
  end
  
  task mem_read(input [ADDR_WIDTH-1:0] read_addr);
    #1
    WE = 0;
    Addr = read_addr;
  endtask
  
  task mem_write(input [ADDR_WIDTH-1:0] write_addr);
    #1
    WE = 1;
    WrData = $random;
    Addr = write_addr;
  endtask
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
endmodule