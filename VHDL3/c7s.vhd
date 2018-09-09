entity C7SEG is 
    port( SW3: IN BIT_VECTOR(3 downto 0);
          HEX0: OUT BIT_VECTOR(6 downto 0));   
              
end C7SEG;

Architecture funcionamento of C7SEG is
begin
  
 
  HEX0(6) <= (SW3(2) XNOR SW3(0)) OR ((NOT SW3(1)) AND ((NOT SW3(0)) OR SW3(3))) OR (SW3(3) AND (NOT SW3(0)));
  HEX0(5) <= ((NOT SW3(3)) AND SW3(0)) OR (SW3(1) AND SW3(0)) OR (SW3(3) AND (NOT SW3(2)) AND (NOT SW3(0))) OR (SW3(3) AND  SW3(2) AND (NOT SW3(1)));
	HEX0(4) <= ((NOT SW3(2)) AND SW3(0)) OR (SW3(1) AND SW3(0)) OR (SW3(3) AND (NOT SW3(2))) OR (SW3(3) AND (NOT SW3(1))) OR ((NOT SW3(3)) AND SW3(2) AND (NOT SW3(0)));
  HEX0(3) <=  ((NOT SW3(3)) AND SW3(1)) OR (SW3(1) AND (NOT SW3(0))) OR ((NOT SW3(3) AND SW3(2))) OR (SW3(3) AND (NOT SW3(2)) AND (NOT SW3(1)));
	HEX0(2) <= (NOT SW3(0)) OR ((NOT SW3(3)) AND (NOT SW3(2)) AND SW3(1)) OR ((NOT SW3(3)) AND  SW3(2) AND (NOT SW3(1)));
  HEX0(1) <= (NOT SW3(0)) or ((NOT SW3(2)) AND (NOT SW3(1))) OR (SW3(3) AND (NOT SW3(1)));
	HEX0(0) <= (NOT SW3(3)) OR ((NOT SW3(1)) AND SW3(0)) OR (SW3(2) AND (NOT SW3(1))) OR ((NOT SW3(2) AND SW3(1) AND (NOT SW3(0))));
       
  end funcionamento;
