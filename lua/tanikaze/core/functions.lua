function ToggleHorizontalTerm()
	vim.cmd([[Neotree close]]);
	vim.cmd([[ToggleTerm direction=horizontal size=15]]);
	vim.cmd([[Neotree show]]);
end
