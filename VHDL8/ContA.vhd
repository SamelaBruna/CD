entity contA is
  port(Ac,Bc: in bit_vector(3 downto 0);
       loadc,Clrc,enc,Clockc: in bit; 
       C: out bit_vector(3 downto 0)
       
       
    );
end contA;

architecture funcionamento of contA is 

  component contador2 is
    port(A: in bit_vector(3 downto 0);
         bUD,Clr,load,en,Clock: in bit; 
         S: out bit_vector(3 downto 0)
 
       
    );
  end component;

  component comparador is 
    port(A,B: in bit_vector(3 downto 0);
         eq,bt,lt: out bit
    );
       
  end component;
  
 component muxSelect3 is 
  port(Am,Bm: in bit_vector(3 downto 0);
       Se0,Se1,Se2: in bit;
       Sabt,Salt: out bit_vector(3 downto 0)
       );
       --Se0 = eq
       --Se1 = bt
       --Se2 = lt
end component;

component JK is
     port (clk,J,K,P,C: IN BIT;
           q: OUT BIT
                   
     ); 
 end component; 

signal seq,sbt,slt: bit;
signal outSabt, outSalt, saCont: bit_vector(3 downto 0);
signal up,dw,saJK, clken: bit;


begin 
   clken <= Clockc and enc;
  
COMP1: comparador port map (
       A=> Ac,
       B=> Bc,
       eq=>seq,
       bt=>sbt,
       lt=> slt
       
       );
 MUX0: muxSelect3 port map(
       Am => Ac,
    	  Bm => Bc,
       Se0 => seq,
       Se1 => sbt,
       Se2 => slt,
       Sabt => outSabt,
       Salt => outSalt
       );
       
  JK0: JK port map (
        clk => '0',
        J=> '0',
        K => '0',
        P => dw,
        C=> up,
        q => saJK
        
    );
       
      up <= (not((outSalt(0) xnor saCont(0)) and (outSalt(1) xnor saCont(1)) and (outSalt(2) xnor saCont(2)) and (outSalt(3) xnor saCont(3))));
      dw <= (not((outSabt(0) xnor saCont(0)) and (outSabt(1) xnor saCont(1)) and (outSabt(2) xnor saCont(2)) and (outSabt(3) xnor saCont(3)))); 
       
  CONT: contador2 port map(
        A => outSalt,
        bUD => saJk,
        Clr => Clrc,
        load => loadc,
        en => enc,
        Clock => clken,
        S => saCont
      );
    
    
end funcionamento;
    