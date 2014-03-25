Fabricator(:meal) do
	user
	name 'apple'
	quantity 1
	time DateTime.now
end
