entity controlador is 
    port(C: in bit;
             ltcompsaida, clock_c: in bit;
             clr_c: in bit;
             load_out: out bit;
             clr_out: out bit;
             D_c: out bit);
end controlador;

 architecture funcionamento of controlador is

 component JK IS port (clk,J,K,P,C: IN BIT;
                             q: OUT BIT);
end component; 

    
   
    signal J0,k1: bit;
    signal si: bit_vector (1 downto 0) ;

begin


    J0 <= (si(0) and not ltcompsaida) or (si(0)and C);
    K1 <= C or si(1);

    JK0: JK port map(
       clk =>clock_c,
       J =>J0,
       K => '1',
       P =>'1',
       C =>clr_c,
       q => si(1));   

       JK1: JK port map(
       clk =>clock_c,
       J => '1',
       K => K1,
       P =>'1',
       C => clr_c,
       q => si(0)); 

    D_c <= si(0) and si(1);
    load_out <= si(0) and not si(1);
    clr_out <= not si(0) and not si(1);

end funcionamento;