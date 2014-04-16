library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity gameBoard is
	port(newTileVal, newTile : in std_logic; --whether new tile is 2 or 4 
			reset : in std_logic;
		  tileLoc : in std_logic_vector(15 downto 0); --location of the new tile
		  tileMove : in std_logic_vector(1 downto 0); --direction to move current tiles
		  move : in std_logic;
		  needTile : out
		  );
end entity;

architecture behavioral of gameBoard is

begin
	process(reset, newTile, tileLoc, tileMove) is
	type row is range 3 to 0;
	type board is array(row, row) of std_logic_vector(10 downto 0);
	variable gb : board; 
	begin
		if (reset = '1') then
			for index in row:
				for jndex in row:
					gb(index, jndex) = "00000000000";
				end loop;
			end loop;
		else if (move = '1') then
			if(tileMove = '0') then --down
				for index in row: --needs work to ensure go from bottom up
					for jndex in range 3 to 1:
						