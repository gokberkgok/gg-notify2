$(function () {
    window.addEventListener('message', function (event) {
        if (event.data.action === 'notify') {
            const icons = {
                success: '<i class="fas fa-check-circle"></i>',
                error: '<i class="fas fa-times-circle"></i>',
                info: '<i class="fas fa-info-circle"></i>'
            };

            const notification = $(`
                <div class="notification ${event.data.type}">
                    <div class="content">
                        <span class="icon">${icons[event.data.type]}</span>
                        <div>
                            <h4>${event.data.title}</h4>
                            <p>${event.data.message}</p>
                        </div>
                    </div>
                </div>
            `);

            $('#notification-container').append(notification);
            //notification.slideDown(300);

            setTimeout(() => {
                notification.slideUp(300, function() {
                    $(this).remove();
                });
            }, event.data.time || 5000);
            
        }
    });
});
