entity datapath is 
  port(Sd,Ad: in bit_vector(7 downto 0);
       lt_comp: out bit;
       lt_clr,lt_ld,clockD: in bit);
end datapath;
       
architecture funcionamento of datapath is
  
 component registrador is 
  port( Dr: in bit_vector(7 downto 0);
        load,clr_r, clock_r: in bit;
        Qr : out bit_vector(7 downto 0));
        
 end component;
                             
  component somador8bits is 
   port(As:  in bit_vector(7 downto 0);
        Bs:  in bit_vector(7 downto 0 );
        Ci: in bit;
        Co: out bit;
        Ss:  out bit_vector(7 downto 0));
  end component;
       
  component comparador is 
    port(A,B: in bit_vector(7 downto 0);
         eq,bt,lt: out bit);
  end component;
  
  signal bts,lts,co_out: bit;
  signal tot,totA: bit_vector(7 downto 0);
  begin
  
  COMPARADOR1: comparador port map(
    A => tot,
    B => Sd,
    eq => bts,
    bt => lts,
    lt => lt_comp);
    
  REGISTRADOR0: registrador port map(
    Dr => totA,
    load => '1',
    clr_r => lt_clr,
    clock_r => clockD,
    Qr => tot );
    
    
  SOMADOR0: somador8bits port map(
    As => tot,
    Bs => Ad,
    Ci => '0',
    Co => co_out,
    Ss => totA);
    
    
  end funcionamento;
    
    
       
       

  
