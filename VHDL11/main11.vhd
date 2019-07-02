entity main11 is 
    port( C_m: in bit;
          S_m: bit_vector(7 downto 0);
          A_m: bit_vector(7 downto 0);
          D_m: out bit;
          clr_m: in bit;
          clock_m: in bit );
end main11;

architecture funcionamento of main11 is
    
component datapath is 
  port(Sd,Ad: in bit_vector(7 downto 0);
       lt_comp: out bit;
       lt_clr,lt_ld,clockD: in bit);
end component;

component controlador is 
    port(C: in bit;
             ltcompsaida, clock_c: in bit;
             clr_c: in bit;
             load_out: out bit;
             clr_out: out bit;
             D_c: out bit);
end component;

signal ltld_out,ltclr_out: bit;
signal ltcomp_out,saidacomp: bit;


begin
  
  ltcomp_out <= not saidacomp;

DATA: datapath port map(
Sd => S_m,
Ad => A_m,
lt_comp => saidacomp,
lt_clr => ltclr_out,
lt_ld => ltld_out,
clockD => clock_m);

Control: controlador port map(
C=> C_m,
ltcompsaida => ltcomp_out,
clock_c => clock_m,
clr_c => clr_m,
load_out => ltld_out,
clr_out => ltclr_out,
D_c => D_m );

 end funcionamento;


       
