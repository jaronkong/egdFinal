///chooseWeight( value, prob, value, prob, etc )
///chooseWeight( values, probabilities, [total] )
//Choose, but with weighted probability

var value, prob, total;

if ( ( argument_count > 3 ) ||
    !is_array( argument[0] ) ||
    !is_array( argument[1] ) )
{
    //Convert to array format
    value = false;
    prob = false;
    total = 0;
    for ( var i = 1; i < argument_count; i += 2 ) {
        value[floor(i/2)] = argument[i-1];
        prob[floor(i/2)] = argument[i];
        total += argument[i];
    }
    return chooseWeight( value, prob, total );
}

total = 0;
value = argument[0];
prob = argument[1];
if ( argument_count < 3 ) {
    for ( var i = 0; i < array_length_1d( prob ); i += 1 ) {
        total += prob[i];
    }
} else {
    total = argument[2];
}

var pick = random( total );
total = 0;
for ( var i = 0; i < array_length_1d( value ); ++i ) {
    total += prob[i];
    if ( total > pick ) return value[i];
}

return value[0]; //Fallback
