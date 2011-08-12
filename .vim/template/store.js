/**
 * My Store
 * File:    @{@expand('%:t')@}@
 * Auther:  sunvisor
 * Date:    @{@strftime('%Y-%m-%d')@}@
 * Copyright (C) Sunvisor @{@strftime('%Y')@}@ All right reserved.
 */
Ext.define('MyApp.store.Users', {
    extend: 'Ext.data.Store',
    model: 'MyApp.model.User',
    autoLoad: true,
    
    proxy: {
        type: 'ajax',
        api: {
            read: 'data/users.json',
            update: 'data/updateUsers.json'
        },
        reader: {
            type: 'json',
            root: 'users',
            successProperty: 'success'
        }
    }
});
