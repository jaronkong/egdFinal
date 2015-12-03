var str = choose(choose('','qu','w','r','t','y','p','s','d','f','g','h','j','k','l','z'),choose('x','c','v','b','n','m','th','sh','ch','ph','tr','kr','str','pr','br','thr'),choose('st','sp','sk','sl','sm','bl','kl','gl','gr','pl'))+choose('a','e','i','o','u','oi','ee','ar','er','ir','or','ur','oor','eer')+choose(choose('ck','ng','nt','nk','mp','mb','qu','w','r','t','y','p','s','d','f','g'),choose('h','j','k','l','z','x','c','v','b','n','m','th','sh','ch','ph','tr'),choose('kr','str','pr','br','thr','st','sp','sk','sl','sm','bl','kl','gl','gr','pl','ss'))+choose('a','e','i','o','u','oi','ee','ar','er','ir','or','ur','oor','eer')+choose(choose('','ps','w','r','t','y','p','s','d','f','g','h','j','k','l','z'),choose('x','c','v','b','n','m','th','sh','ch','ph'),choose('st','sp','sk','ng','ck','nk','mp','nt','mb'),'ss')
var bad = ds_list_create( );
ds_list_add(bad, "shit", "ass",'fuck','nig','chink','crap','bich','cunt','dick','poop','queer','gay','but','piss','shart');
ds_list_add(bad, 'isis');
for (var i = 0; i < ds_list_size(bad); ++i) {
    if (string_count(bad[|i], str) > 0) {
        ds_list_destroy(bad);
        return generate_creature_name();
    }
}
ds_list_destroy(bad);
return str;
