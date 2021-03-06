/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [UniqueID ]
      ,[ParcelID]
      ,[LandUse]
      ,[PropertyAddress]
      ,[SaleDate]
      ,[SalePrice]
      ,[LegalReference]
      ,[SoldAsVacant]
      ,[OwnerName]
      ,[OwnerAddress]
      ,[Acreage]
      ,[TaxDistrict]
      ,[LandValue]
      ,[BuildingValue]
      ,[TotalValue]
      ,[YearBuilt]
      ,[Bedrooms]
      ,[FullBath]
      ,[HalfBath]
  FROM [PROJECT].[dbo].[TBL_HOUSING]

  --Cleaning Data in SQL Queries

USE PROJECT
SELECT *FROM TBL_HOUSING
--how many records in tbl_housing

select * from tbl_housing
--total 56477 records available in tbL_housing.

--Populate  Owner Name whose Property Address is Missing

SELECT OwnerName,PropertyAddress
FROM TBL_HOUSING
where 
PropertyAddress is null and OwnerName is not null

--list how many  unique address from Property Address
select distinct PropertyAddress
from tbl_housing
where
PropertyAddress is not null
---45068 unique property address.
--list 3 Bedrooms records with land value and owner name and address.
select OwnerName+' :'+OwnerAddress as Owner_Detail,Bedrooms,LandValue
from tbl_housing
where
Bedrooms=3
--seperate the property address
select PropertyAddress,
left(PropertyAddress,charindex(' ',PropertyAddress)) as zip_code,
right(PropertyAddress,len(PropertyAddress)-charindex(',',PropertyAddress)) as street_name
from tbl_housing

--list 2015 & 2016 records
select OwnerName,PropertyAddress, SaleDate,year(SaleDate) as sale_year 
from TBL_HOUSING
where
year(SaleDate) in (2015,2016) and OwnerName is not null

--list out the property where land use is single family
select * from TBL_HOUSING
where 
upper(LandUse) like 'SIN%'

--find out top 50 records in term of sale price
select top 50 *from TBL_HOUSING
order by
SalePrice desc

--select the record where property address is  missing
select * from TBL_HOUSING
where 
PropertyAddress is null

--list out unique id in asc order and saleprice in descending order
select * from TBL_HOUSING
order by
[UniqueID ] asc,SalePrice desc

--list all record details where SalesPrice are between 10 lakh and 50lakh.

select * from TBL_HOUSING
where
SalePrice between 1000000 and 5000000

--or
select * from TBL_HOUSING
where
SalePrice >=1000000 and SalePrice <=5000000

--duplicate parcelid details

select ParcelID,count(ParcelID) cnt_of_parcelid
from TBL_HOUSING
group by
ParcelID
having
count(ParcelID)>1