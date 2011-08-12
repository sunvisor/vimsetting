/**
 * My Viewport
 * File:    @{@expand('%:t')@}@
 * Auther:  sunvisor
 * Date:    @{@strftime('%Y-%m-%d')@}@
 * Copyright (C) Sunvisor @{@strftime('%Y')@}@ All right reserved.
 */
Ext.define('MyApp.view.Viewport', {
    extend: 'Ext.container.Viewport',
    alias: 'widget.MyApp.viewport',
    id: 'MyApp.Viewport',
    layout: 'border',
    items: [
        {
            xtype: 'MyApp.userlist',
            region: 'center'
        }

    ]
});
