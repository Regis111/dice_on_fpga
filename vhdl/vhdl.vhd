library ieee;
use ieee.std_logic_1164.all;

entity projekt2 is
  port(CLK, R : in bit;
            Q : out std_logic_vector(6 downto 0));
end projekt2;

architecture a1 of projekt2 is
	signal CLK2 : std_logic := '0';
begin 
	process
		variable counter : integer range 0 to 12_000_001;
	begin
	wait until CLK'event and CLK = '1';
		counter := counter + 1;
		if counter = 1_500_000 then
			counter := 0;
			CLK2 <= not CLK2;
		end if;
	
	end process;
		
	process
			variable tmpQ : integer range 0 to 7 := 1;
		begin
		wait until CLK2'event and CLK2 = '1';
			
			if R = '0' then 
					tmpQ := tmpQ + 1;
					if tmpQ = 7 then
						tmpQ := 1;
					end if;
			end if;
			
			case tmpQ is
				when 1 => Q <= "1001111";
				when 2 => Q <= "0010010";
				when 3 => Q <= "0000110";
				when 4 => Q <= "1001100";
				when 5 => Q <= "0100100";
				when 6 => Q <= "0100000";
				when others => Q <= "1111111";
			end case;
				

	end process;
end a1;