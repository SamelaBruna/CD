entity registrador is 
  port( Dr: in bit_vector(7 downto 0);
        load,clr_r, clock_r: in bit;
        Qr : out bit_vector(7 downto 0));
        
end registrador;
  
  architecture funcionamento of registrador is
  
  component ffd IS 
    port (clk,D,P,C: IN BIT; q: OUT BIT); 
  end component;
  
  signal D_r: bit_vector(7 downto 0);
  signal Q_r: bit_vector(7 downto 0);
  
begin

D_r(7) <= (load and Dr(7)) or (not load and Q_r(7));
D_r(6) <= (load and Dr(6)) or (not load and Q_r(6));
D_r(5) <= (load and Dr(5)) or (not load and Q_r(5));
D_r(4) <= (load and Dr(4)) or (not load and Q_r(4));
D_r(3) <= (load and Dr(3)) or (not load and Q_r(3));
D_r(2) <= (load and Dr(2)) or (not load and Q_r(2));
D_r(1) <= (load and Dr(1)) or (not load and Q_r(1));
D_r(0) <= (load and Dr(0)) or (not load and Q_r(0));

  
  ff0 : ffd port map(
    clk => clock_r,
    D => D_r(0),
    P => '1',
    C => clr_r,
    q => Qr(0));
 
  ff1 : ffd port map(
    clk => clock_r,
    D => D_r(1),
    P => '1',
    C => clr_r,
    q => Qr(1));
  
  ff2 : ffd port map(
    clk => clock_r,
    D => D_r(2),
    P => '1',
    C => clr_r,
    q => Qr(2));
  
  ff3 : ffd port map(
    clk => clock_r,
    D => D_r(3),
    P => '1',
    C => clr_r,
    q => Qr(3));
  
  ff4 : ffd port map(
    clk => clock_r,
     D => D_r(4),
    P => '1',
    C => clr_r,
    q => Qr(4));

  
  ff5 : ffd port map(
    clk => clock_r,
    D => D_r(5),
    P => '1',
    C => clr_r,
    q => Qr(5));

  
  ff6 : ffd port map(
    clk => clock_r,
    D => D_r(6),
    P => '1',
    C => clr_r,
    q => Qr(6)); 
    
  ff7 : ffd port map(
    clk => clock_r,
     D => D_r(7),
    P => '1',
    C => clr_r,
    q => Qr(7));


end funcionamento;











