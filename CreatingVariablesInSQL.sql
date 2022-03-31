declare @myVariable int
set @myVariable = 6
print @myVariable

declare @var1 int, @var2 int
set @var1 = 10
set @var2 = 5



print  'Variable 1 = ' + CONVERT(VARCHAR(5),@var1) + char(13) + ' variable 2  equals = ' + convert(varchar(5),@var2) + char(13) + 'Total '
print @var1 + @var2

if @var1 <2
	Begin
	print '@Var1 < 2 '
	End
else if @var1>1 and @var1<3
	begin
	print 'variable 1 is greater than 1 and less than 3 '
	end
else if @var1 = 4 or @var1<6
	begin
	print 'variable 1 is 4, or it is less than 6.'
	end
else
	print 'variable 1 does not qualify'

	