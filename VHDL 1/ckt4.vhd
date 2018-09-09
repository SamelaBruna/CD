entity ckt4 is 
    port( A: IN BIT_VECTOR(3 downto 0);
          S: OUT BIT_VECTOR(1 downto 0));   
              
end ckt4;

Architecture funcionamento of ckt4 is
begin
 
    S(1) <= (A(3) or A(2)) xnor (A(3) xor (A(2) xor A(1))) ;
    s(0) <= (A(0) or (A(2) xor A(1))) or (A(3) xor (A(2) xor A(1))) ;
    
      
  end funcionamento;
