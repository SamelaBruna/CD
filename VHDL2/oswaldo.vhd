entity sete_seg is
      port(SW: in bit_vector(3 downto 0);
           HEX: out bit_vector(6 downto 0));
end sete_seg;

architecture sete_seg of sete_seg is

begin

 HEX(0) <= (not SW(3)) or ((not SW(1)) and (SW(0) or SW(2))) or ((not SW(2)) and SW(1) and (not SW(0)));
 HEX(1) <= (not SW(0)) or ((not SW(1)) and ((not SW(2)) or SW(3)));
 HEX(2) <= ((not SW(3)) and (SW(2) xor SW(1))) or (not SW(0));
 HEX(3) <= ((not SW(3)) and (SW(1) or SW(2))) or (SW(1) and (not SW(0))) or (SW(3) and (not SW(2)) and (not SW(1)));
 HEX(4) <= (SW(0) and ((not SW(2)) or SW(1))) or (SW(3) and ((not SW(2)) or (not SW(1)))) or ((not SW(3) and SW(2) and (not SW(0))));
 HEX(5) <= (SW(0) and ((not SW(3)) or SW(2))) or (SW(3) and (((not SW(1)) and (not SW(0))) or ((not SW(2)) and SW(1))));
 HEX(6) <= (SW(2) xnor SW(0)) or ((not SW(1)) and ((not SW(0)) or SW(3))) or (SW(3) and (not SW(0)));

end sete_seg;
