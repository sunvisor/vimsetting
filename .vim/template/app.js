/**
 * My Application
 * File:    @{@expand('%:t')@}@
 * Auther:  sunvisor
 * Date:    @{@strftime('%Y-%m-%d')@}@
 * Copyright (C) Sunvisor @{@strftime('%Y')@}@ All right reserved.
 */
Ext.application({
    name: 'MyApp',

    appFolder: 'app',

    controllers: [
        'MyController'
    ],

    launch: function() {
        // initialize
    }
})
