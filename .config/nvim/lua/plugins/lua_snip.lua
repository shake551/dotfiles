return {
    'L3MON4D3/LuaSnip',
    config = function()
	require('luasnip').config.set_config({
	    history = true,
	    updateevents = 'TextChanged,TextChangedI'
	})
    end
}
