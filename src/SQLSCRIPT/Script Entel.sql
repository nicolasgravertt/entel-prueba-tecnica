USE [Entel]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarcaAuto](
	[idMarca] [int] NOT NULL,
	[nombreMarca] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModeloAuto](
	[idModelo] [int] NOT NULL,
	[nombreModelo] [nvarchar](50) NULL,
	[idMarca] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitudes](
	[idSolicitud] [int] NOT NULL,
	[idVendedor] [int] NULL,
	[idModelo] [int] NULL,
	[fechaSolicitud] [date] NULL,
	[monto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[idVendedor] [int] NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[correo] [nvarchar](50) NULL,
	[telefono] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[idVendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[MarcaAuto] ([idMarca], [nombreMarca]) VALUES (1, N'KIA')
INSERT [dbo].[MarcaAuto] ([idMarca], [nombreMarca]) VALUES (2, N'Mercedez')
INSERT [dbo].[MarcaAuto] ([idMarca], [nombreMarca]) VALUES (3, N'Honda')
GO
INSERT [dbo].[ModeloAuto] ([idModelo], [nombreModelo], [idMarca]) VALUES (1, N'Modelo 1', 1)
INSERT [dbo].[ModeloAuto] ([idModelo], [nombreModelo], [idMarca]) VALUES (2, N'Modelo 2', 2)
INSERT [dbo].[ModeloAuto] ([idModelo], [nombreModelo], [idMarca]) VALUES (3, N'Modelo 3', 3)
INSERT [dbo].[ModeloAuto] ([idModelo], [nombreModelo], [idMarca]) VALUES (4, N'Modelo 4', 1)
GO
INSERT [dbo].[Solicitudes] ([idSolicitud], [idVendedor], [idModelo], [fechaSolicitud], [monto]) VALUES (1, 1, 1, CAST(N'2023-11-30' AS Date), 1000)
INSERT [dbo].[Solicitudes] ([idSolicitud], [idVendedor], [idModelo], [fechaSolicitud], [monto]) VALUES (2, 2, 2, CAST(N'2023-11-30' AS Date), 1000)
INSERT [dbo].[Solicitudes] ([idSolicitud], [idVendedor], [idModelo], [fechaSolicitud], [monto]) VALUES (3, 3, 3, CAST(N'2023-11-30' AS Date), 1000)
INSERT [dbo].[Solicitudes] ([idSolicitud], [idVendedor], [idModelo], [fechaSolicitud], [monto]) VALUES (4, 3, 3, CAST(N'2023-11-30' AS Date), 1000)
INSERT [dbo].[Solicitudes] ([idSolicitud], [idVendedor], [idModelo], [fechaSolicitud], [monto]) VALUES (5, 2, 3, CAST(N'2023-11-30' AS Date), 1000)
INSERT [dbo].[Solicitudes] ([idSolicitud], [idVendedor], [idModelo], [fechaSolicitud], [monto]) VALUES (6, 2, 2, CAST(N'2023-10-10' AS Date), 50000)
INSERT [dbo].[Solicitudes] ([idSolicitud], [idVendedor], [idModelo], [fechaSolicitud], [monto]) VALUES (7, 2, 3, CAST(N'2023-09-10' AS Date), 100000)
INSERT [dbo].[Solicitudes] ([idSolicitud], [idVendedor], [idModelo], [fechaSolicitud], [monto]) VALUES (8, 2, 3, CAST(N'2023-07-10' AS Date), 60000)
GO
INSERT [dbo].[Vendedor] ([idVendedor], [nombre], [apellido], [correo], [telefono]) VALUES (1, N'Nicolas', N'Gravertt', N'asd@asd.com', N'+56999999999')
INSERT [dbo].[Vendedor] ([idVendedor], [nombre], [apellido], [correo], [telefono]) VALUES (2, N'Maria', N'Acevedo', N'asd@asd.com', N'+56999999999')
INSERT [dbo].[Vendedor] ([idVendedor], [nombre], [apellido], [correo], [telefono]) VALUES (3, N'Rosa', N'Martinez', N'asd@asd.com', N'+56999999999')
GO
ALTER TABLE [dbo].[ModeloAuto]  WITH CHECK ADD FOREIGN KEY([idMarca])
REFERENCES [dbo].[MarcaAuto] ([idMarca])
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD FOREIGN KEY([idModelo])
REFERENCES [dbo].[ModeloAuto] ([idModelo])
GO
ALTER TABLE [dbo].[Solicitudes]  WITH CHECK ADD FOREIGN KEY([idVendedor])
REFERENCES [dbo].[Vendedor] ([idVendedor])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nicolas,,Name>
-- Create date: <13/11/2023>
-- Description:	<Obtener las 3 marcas más solicitadas y la cantidad de solicitudes de cada una ordenadas descendentemente>
-- =============================================
CREATE PROCEDURE [dbo].[Marcas_Mas_Solicitadas]
AS
BEGIN
    SELECT TOP 3 [dbo].[MarcaAuto].nombreMarca, COUNT([dbo].[Solicitudes].idSolicitud) AS TotalSolicitudes
	FROM MarcaAuto
	LEFT JOIN ModeloAuto ON [dbo].[MarcaAuto].idMarca = [dbo].[ModeloAuto].idMarca
	LEFT JOIN Solicitudes ON [dbo].[ModeloAuto].idModelo = [dbo].[Solicitudes].idModelo
	GROUP BY [dbo].[MarcaAuto].nombreMarca
	ORDER BY TotalSolicitudes DESC;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nicolas>
-- Create date: <13/11/2023>
-- Description:	< Obtener 3 meses con más dinero en ventas:
--Ejemplo: 1. Julio I0I3 - $50.000.000
--2. Diciembre I0II - $48.000.000
--3. Febrero I0I3 - $39.000.000>
-- =============================================
CREATE PROCEDURE [dbo].[Mas_Dinero_Ventas_Ultimos_Tres_Meses]
AS
BEGIN
    SELECT Top 3 
    YEAR([dbo].[Solicitudes].fechaSolicitud) AS Year,
    MONTH([dbo].[Solicitudes].fechaSolicitud) AS Month,
    SUM([dbo].[Solicitudes].monto) AS TotalVentas
	FROM [dbo].[Solicitudes]
	GROUP BY YEAR([dbo].[Solicitudes].fechaSolicitud), MONTH([dbo].[Solicitudes].fechaSolicitud)
	ORDER BY TotalVentas DESC
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nicolas>
-- Create date: <13/11/2023>
-- Description:	<Obtener modelos que no tengan solicitudes>
-- =============================================
CREATE PROCEDURE [dbo].[Modelos_Sin_Solicitudes]
AS
BEGIN
    SELECT *
	FROM [dbo].[ModeloAuto]
	LEFT JOIN [dbo].[Solicitudes] ON [dbo].[ModeloAuto].idModelo = [dbo].[Solicitudes].idModelo
	WHERE [dbo].[Solicitudes].idSolicitud IS NULL;
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nicolas>
-- Create date: <13/11/2023>
-- Description:	<Obtener solicitudes del mes actual>
-- =============================================
CREATE PROCEDURE [dbo].[Solicitudes_Mes_Actual]
AS
BEGIN
    SELECT *
	FROM [dbo].[Solicitudes]
	WHERE MONTH([dbo].[Solicitudes].fechaSolicitud) = MONTH(GETDATE()) AND YEAR([dbo].[Solicitudes].fechaSolicitud) = YEAR(GETDATE());
END;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Nicolas>
-- Create date: <13/11/2023>
-- Description:	<Obtener el vendedor que menos solicitudes haya generado en los últimos 30 días>
-- =============================================
CREATE PROCEDURE [dbo].[Vendedor_Menos_Solicitudes]
AS
BEGIN
    SELECT TOP 1 [dbo].[Vendedor].idVendedor, [dbo].[Vendedor].nombre, [dbo].[Vendedor].apellido, COUNT([dbo].[Solicitudes].idSolicitud) AS TotalSolicitudes
	FROM [dbo].[Vendedor]
	LEFT JOIN [dbo].[Solicitudes] ON [dbo].[Vendedor].idVendedor = [dbo].[Solicitudes].idVendedor
	GROUP BY [dbo].[Vendedor].idVendedor, [dbo].[Vendedor].nombre, [dbo].[Vendedor].apellido
	ORDER BY TotalSolicitudes ASC;
END;
GO
