entity datapath is
  port(Ad,Bd: in bit_vector(7 downto 0);
       cli,ldi,clr,ldr,lds,clockD: in bit;
       ci: out bit;
       Sad: out bit_vector(7 downto 0));
       
end datapath;


architecture funcionamento of datapath is
  
component V_Abs is
  port(Ain,Bin: in bit_vector(7 downto 0);
       Absout: out bit_vector(7 downto 0));
end component;


component somador8bits is 
  port(As:  in bit_vector(7 downto 0);
       Bs:  in bit_vector(7 downto 0 );
       Ci: in bit;
       Co: out bit;
       Ss:  out bit_vector(7 downto 0));
       
end component;


component registrador is 
  port( Dr: in bit_vector(7 downto 0);
        load,clr_r, clock_r: in bit;
        Qr : out bit_vector(7 downto 0));
        
end component;

component contadorUD is
  port(bUD,Clr,en,Clock: in bit; 
       S: out bit_vector(3 downto 0)
       
       
    );
end component;

component comparador4 is 
  port(A,B: in bit_vector(3 downto 0);
       eq,bt,lt: out bit
       );
       
end component;

signal Abs_out,somador_out,registrador1_out,registrador2_out: bit_vector(7 downto 0);
signal lixos: bit_vector(2 downto 0);
signal incrementador_out: bit_vector(3 downto 0);

begin

ABS0: V_abs port map(
      Ain => Ad,
      Bin => Bd,
      Absout => abs_out);
      
REGISTRADOR1: registrador port map(
            Dr => somador_out,
            load => ldr,
            clr_r =>clr,
            clock_r => clockD,
            Qr => registrador1_out);
  
      
SOMADOR: somador8bits port map(
         As => abs_out,
         Bs => registrador1_out,
         Ci => '0',
         Co => lixos(0),
         Ss => somador_out);
         
REGISTRADOR2: registrador port map(
            Dr => registrador1_out,
            load => lds,
            clr_r =>'1',
            clock_r => clockD,
            Qr => Sad);
            
INCREMENTADOR: contadorUD port map(
              bUD =>'0',
              Clr =>cli,
              en => ldi,
              Clock => clockD,  
              S => incrementador_out);
              
COMPARADOR: comparador4 port map(
              A => incrementador_out,
              B => "1111",
              eq => lixos(1),
              bt => lixos(2),
              lt => ci);
              
end funcionamento;
            
      
      
    