
if(exists(select * from sys.objects where name = 'proc_insert_Customer'))
	drop proc proc_insert_customer;
go

create proc proc_insert_customer
(
	@id int out
	,@name nvarchar(50)
	,@phone nvarchar(11)
	,@email nvarchar(50)
	,@pass nvarchar(100)
	,@admin bit = 0
)
as
begin
	set nocount on;

	--Ktra input:
	if(@name = null or @phone = null or @email = null or @pass = null)
	begin
		set @id = 0;
		return;
	end
	--Ktra sdt:
	if(exists(select* from Customers where Phone = @phone))
	begin
		set @id = -2;
		return;
	end
	--Ktr email
	if(exists(select* from Customers where Email = @email))
	begin
		set @id = -3;
		return;
	end

	--insert customer:
	insert into Customers(Name,Phone,Email,Password,Admin) values (@name, @phone, @email, @pass, @admin);
	set @id = @@IDENTITY;
end
go