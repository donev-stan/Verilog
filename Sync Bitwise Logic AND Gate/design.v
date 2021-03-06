module my_sync_module #(parameter WIDTH=4) (
  input clk,
  input [WIDTH-1:0] a, b,
  output reg [WIDTH-1:0] c
);
  
  always @(posedge clk)
    c <= a & b;
  
  /*
  Много съществено е употребата на т.нар. неблокиращо присвояване (<= non-blocking assignment) при описанието на регистър -   това е конструкция на Верилог, която указва присвояването на дясната страна на лявата да се извърши спрямо текущата стойност от дясно, което е същината на синхронната логика. При блокиращо присвояване се прави първо преизчисляване на дясната част и след това тази стойност се прехвърля на лявата
  */

endmodule