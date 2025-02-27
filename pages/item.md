---
title: Item Deepdive
---
###  A closer look at the  Items sold
<Details title='How to edit this page'>

  This page can be found in your project at `/pages/item.md`. Make a change to the markdown file and save it to see the change take effect in your browser.
</Details>

```sql categories
  select
      category
  from needful_things.orders
  group by category
```

<Dropdown data={categories} name=category value=category>
    <DropdownOption value="%" valueLabel="All Categories"/>
</Dropdown>

<Dropdown name=year>
    <DropdownOption value=% valueLabel="All Years"/>
    <DropdownOption value=2019/>
    <DropdownOption value=2020/>
    <DropdownOption value=2021/>
</Dropdown>



# Item
## Sale Distribution

```sql item_query
select 'Boxing Gloves' as donut, 419 as count
union all
select 'Fishing Rod' as donut, 562 as count
union all
select 'Running Shoes' as donut, 1085 as count
union all
select 'Necklace' as donut, 644 as count
union all
select 'Vintage Jacket' as donut, 846 as count
union all
select 'Mystic Pendant' as donut, 1103 as count
union all
select 'Microscope' as donut, 453 as count
union all
select 'Typewriter' as donut, 478 as count
union all
select 'Lamp' as donut, 1552 as count
union all
select 'Toy Doll' as donut, 415 as count
union all
select 'Model Racehorse' as donut, 1095 as count
union all
select 'Baseball Card' as donut, 1258 as count
```

```sql item_data
select donut as name, count as value
from ${item_query}
```

<ECharts config={
    {
        tooltip: {
            formatter: '{b}: {c} ({d}%)'
        },
      series: [
        {
          type: 'pie',
          radius: ['50%', '100%'],
          data: [...item_data],
        }
      ]
      }
    }
/>



### Takaway
The item sales are more unevenly distributed, with four items, Baseball Cards, Model Racehorse, Lamp and Running shoes, accounting for more than half the volume of sales.


## Value
```sql cat_value_query
SELECT category, COUNT(sales) as number_of_Units, 
       ROUND(SUM(sales), 2) as val_sales, item
FROM orders
GROUP BY category, item;
```

```sql Item_value_data
SELECT item, category, COUNT(sales) as number_of_Units, 
       ROUND(SUM(sales), 2) as val_sales,
       round(val_sales/number_of_Units, 2) as price
FROM orders
GROUP BY item, category
ORDER BY item, number_of_Units;
```
<BubbleChart 
    data={Item_value_data}
    x=number_of_Units
    y=price
    yFmt=usd0
    series=category
    seriesColors=category
    size=val_sales
    tooltipTitle=item
    scaleTo=1.25
/>

### Takeaway
The best-selling item, by far is **_Lamp_**, distantly followed by **_Baseball Cards_**. While the four most high-value items are **_Microscope_**, **_Typewriter_**,**_Fishing Rod_** and **_Running Shoes_**. The five most valueable items represent only 2/4 Categories, _Odd Equpment_ and _Cursed Sporting Goods_.
