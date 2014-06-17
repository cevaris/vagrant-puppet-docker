node 'ws00.example.local' {
    include apache

    notify { 'my_message':
        message => hiera('my_message'),
    }

}
