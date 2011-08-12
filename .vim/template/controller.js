/**
 * My Controller
 * File:    @{@expand('%:t')@}@
 * Auther:  sunvisor
 * Date:    @{@strftime('%Y-%m-%d')@}@
 * Copyright (C) Sunvisor @{@strftime('%Y')@}@ All right reserved.
 */
Ext.define('MyApp.controller.Users', {
    extend: 'Ext.app.Controller',

    stores: [
        'Users'
    ],

    views: [
        'user.List',
        'user.Edit'
    ],

    init: function() {
        this.control({
            'userlist': {
                itemdblclick: this.editUser
            }
        })
    },

    editUser: function(grid, record) {
        var view = Ext.widget('useredit');

        view.down('form').loadRecord(record);
    }
});
