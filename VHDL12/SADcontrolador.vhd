entity SADcontrolador is
  port (C,clockC,clearC: in bit;
           ci_c: in bit;
           D,cli_c,ldi_c,clr_c,ldr_c,lds_c: out bit);

end SADcontrolador;

architecture funcionamento of SADcontrolador is

component JK IS
  port (clk,J,K,P,C: IN BIT;
        q: OUT BIT); 
end component;
 
 signal J0,J1,J2,K0,K1,K2: bit;
 signal si: bit_vector(2 downto 0);
 begin
   
   J0 <= not si(1) and not C;
   K0 <= not si(2) and si(1) and not ci_c;
   J1 <= si(0);
   K1 <= not si(0);
   J2 <= si(1) and si(0) and ci_c;
   K2 <= '1';
 
JK2: JK port map(
       clk =>clockC,
       J =>J2,
       K => K2,
       P =>'1',
       C =>clearC,
       q => si(2));   

JK1: JK port map(
       clk =>clockC,
       J => J1,
       K => K1,
       P =>'1',
       C => ClearC,
       q => si(1)); 
       
JK0: JK port map(
       clk =>clockC,
       J => J0,
       K => K0,
       P =>'1',
       C => ClearC,
       q => si(0)); 
       
       
cli_c <=  si(2) or si(1) or not si(0);
ldi_c <= not si(2) and si(1) and si(0);
clr_c <= si(2) or si(1) or not si(0);
ldr_c <=  not si(2) and si(1) and si(0);
lds_c <= not si(2) and si(1) and not si(0);
D  <= not si(2) and si(1) and not si(0);      

       
end funcionamento;
