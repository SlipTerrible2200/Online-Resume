---
title: Trial 
---
###  Pushing buttons

## Channel to Sale path - Item and Category
```sql categories
  select
      category
  from needful_things.orders
  group by category
```
<ButtonGroup 
    data={categories} 
    name=category_picker 
    value=category
/>

Selected: {inputs.category_picker}

```sql channel_table_item
select channel, category, item, round(avg(sales), 2) as avg_sales
FROM orders
where category like '${inputs.category_picker}'
group by channel, category, item
order BY channel, category;
```

<SankeyDiagram 
    data={channel_table_item} 
    sourceCol= channel
    targetCol = item
    valueCol= avg_sales
/>

### Takeaway
The best selling items gain the most leads from the marketing channels, but theres is nothing to suggest that certain channels prefer certain items or that certain channels result in greater sales. The lack of trend is disturbing.

