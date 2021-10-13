-- Q7 Write a PLpgSQL function called hotelsIn() that takes a single argument giving the name of a suburb, and returns a text string containing the names of all hotels in that suburb, one per line.

create or replace function hotelsIn(_addr text) returns text
as $$
declare
	_bar Bars;
	_result text := '';
begin
	for _bar in 
	select * from bars
	where addr = _addr
	loop
		_result := _result || _bar.name || e'\n';
	end loop;

	return _result;
end;
$$ language plpgsql;

-- Q8 Write a new PLpgSQL function called hotelsIn2() that takes a single argument giving the name of a suburb and returns the names of all hotels in that suburb. The hotel names should all appear on a single line, as in the following example:
-- Hotels in The Rocks:  Australia Hotel  Lord Nelson

create or replace function hotelsIn2(_addr text) returns text
as $$
declare
	_bar Bars;
	_result text := '';
begin
	for _bar in 
	select * from bars
	where addr = _addr
	loop
		_result := _result || '  ' || _bar.name;
	end loop;

	if found then
		return 'Hotels in ' || _addr || ':' || _result;
	end if;

	return 'There are no hotels in ' || _addr;
end;
$$ language plpgsql;

-- Q9 
create or replace function
    happyHourPrice (_hotel text, _beer text, _discount real) returns text
as $$
declare
	_count integer;
	_price real;
	_new_price real;
begin
	-- check that hotel exists
	select count(*) into _count
	from bars
	where name = _hotel;

	if _count = 0 then
		return 'There is no hotel called ''' || _hotel || '''';
	end if;

	-- check that beer exists
	select count(*) into _count
	from beers
	where name = _beer;

	if _count = 0 then
		return 'There is no beer called ''' || _beer || '''';
	end if;

	-- check that beer is sold at hotel
	select price into _price
	from sells s
	join bars ba on (s.bar = ba.id)
	join beers be on (s.beer = be.id)
	where ba.name = _hotel
	and be.name = _beer;

	if not found then
		return 'The ' || _hotel || ' does not serve ' || _beer;
	end if;

	-- attempt a price reduction
	_new_price = _price - _discount;
	if _new_price < 0 then
		return 'Price reduction is too large; ' || _beer || ' only costs ' || to_char(_price,'$9.99');
	end if;

	return 'Happy hour price for ' || _beer || ' at ' || _hotel || ' is ' || to_char(_new_price,'$9.99');

end;
$$ language plpgsql;

-- Q10 Write a SQL function hotelsIn3() that returns a table of records of all the bars in a suburb

create or replace function hotelsIn3(_addr text) returns setof Bars
as $$ 
	select * from bars where addr = _addr;
$$ language sql;

-- Q11 Rewrite the above in PLpgSQL

create or replace function hotelsIn4(_addr text) returns setof Bars
as $$
begin
	return query
	select * from bars where addr = _addr;	
end;
$$ language plpgsql;