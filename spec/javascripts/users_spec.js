describe('Users page', function() {
    it("click on edit", function() {

        var spyEvent = spyOnEvent('.edit_user', 'click')
        $('.edit_user')[0].click()
        expect('click').toHaveBeenTriggeredOn('.edit_user')
    });
});