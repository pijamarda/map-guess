--Configuration
function love.conf(t)
	t.tittle = "Map Guess"
	t.version = "0.10.1"

	

	--esto lo agrego yo porque si
	t.modules.joysticj = false
	t.modules.physics = false

	--para debugear en Windows
	t.console = true
end