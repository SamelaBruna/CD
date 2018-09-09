entity ciBINBCD is
  port (A: in bit_vector(3 downto 0);
        S: out bit_vector(3 downto 0));
end ciBINBCD;


architecture funcionamento of ciBINBCD is
  
begin
  
	S(3)<= (A(3) and (not A(2))) or (A(2) and A(0)) or (A(2) and A(1));
  S(2)<= (A(2) and (not A(1)) and (not A(0))) or (A(3) and A(0));
	S(1)<= (A(3) and (not A(0))) OR (A(1) and A(0)) OR ((not A(2)) and A(1));
	S(0)<= (A(3) and (not A(0))) OR ((not A(3)) and (not A(2)) and A(0)) OR (A(2) and A(1) and (not A(0)));
  
  
end funcionamento;
