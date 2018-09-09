entity ckt2 is 
    port( A: IN BIT_VECTOR(3 downto 0);
          S: OUT BIT_VECTOR(1 downto 0));   
              
end ckt2;

Architecture funcionamento of ckt2 is
begin
 
    S(1) <= (A(3) xor A(2)) or (A(3) and (A(2) xnor A(1))); 
    s(0) <= (A(0) xor (A(2) xnor A(1))) and (A(3) and (A(2) xnor A(1))); 
    
      
  end funcionamento;
