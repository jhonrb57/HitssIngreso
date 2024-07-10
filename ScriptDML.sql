USE [MiIngresoHitss]
GO

INSERT INTO [dbo].[Producto]
           ([IdProducto]
           ,[CodigoProducto]
           ,[NombreProducto]
           ,[Imagen]
           ,[Precio])
     VALUES
           (<IdProducto, varchar(50),>
           ,<CodigoProducto, int,>
           ,<NombreProducto, varchar(max),>
           ,<Imagen, varbinary(max),>
           ,<Precio, decimal(18,0),>)
GO

USE [MiIngresoHitss]
GO

INSERT INTO [dbo].[Compra]
           ([IdCompra]
           ,[IdCliente]
           ,[IdProducto]
           ,[FechaCompra])
     VALUES
           (<IdCompra, varchar(50),>
           ,<IdCliente, varchar(50),>
           ,<IdProducto, varchar(50),>
           ,<FechaCompra, date,>)
GO

USE [MiIngresoHitss]
GO

INSERT INTO [dbo].[Cliente]
           ([IdCliente]
           ,[CodigoCliente]
           ,[NombreCliente])
     VALUES
           (<IdCliente, varchar(50),>
           ,<CodigoCliente, int,>
           ,<NombreCliente, varchar(max),>)
GO