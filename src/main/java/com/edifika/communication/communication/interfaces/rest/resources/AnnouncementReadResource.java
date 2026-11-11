package com.edifika.communication.communication.interfaces.rest.resources;

import java.util.Date;

public record AnnouncementReadResource(
        Long id,
        Long announcementId,
        Long userId,
        Date readAt
) {
}
